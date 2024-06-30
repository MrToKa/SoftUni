using Microsoft.EntityFrameworkCore;
using SoftUni.Data;
using SoftUni.Models;
using System.Text;

namespace SoftUni
{
    public class StartUp
    {
        public static void Main(string[] args)
        {
            SoftUniContext? context = new SoftUniContext();
            using (context)
            {
                string result = RemoveTown(context);
                Console.WriteLine(result);
            }
        }

        public static string RemoveTown(SoftUniContext context)
        {      
            var town = context.Towns
                .FirstOrDefault(t => t.Name == "Seattle");

            var addresses = context.Addresses
                .Where(a => a.Town == town)
                .ToList();

            var employees = context.Employees
                .Where(e => addresses.Contains(e.Address))
                .ToList();

            foreach (Employee employee in employees)
            {
                employee.AddressId = null;
            }

            context.Addresses.RemoveRange(addresses);
            context.Towns.Remove(town);

            context.SaveChanges();

            return $"{addresses.Count} addresses in Seattle were deleted"; 
        }

        public static string DeleteProjectById(SoftUniContext context)
        {
            var project = context.Projects.Find(2);

            var employeesProjects = context.EmployeesProjects
                .Where(ep => ep.ProjectId == 2)
                .ToList();

            context.EmployeesProjects.RemoveRange(employeesProjects);

            context.Projects.Remove(project);

            context.SaveChanges();

            var projects = context.Projects
                .Take(10)
                .Select(p => p.Name)
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var projectName in projects)
            {
                stringBuilder.AppendLine(projectName);
            }
            return stringBuilder.ToString();
        }

        public static string GetEmployeesByFirstNameStartingWithSa(SoftUniContext context)
        {
            var employees = context.Employees
                .Where(e => EF.Functions.Like(e.FirstName, "Sa%"))
                .Select(e => new
                {
                    e.FirstName,
                    e.LastName,
                    e.JobTitle,
                    e.Salary
                })
                .OrderBy(e => e.FirstName)
                .ThenBy(e => e.LastName)
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var employee in employees)
            {
                stringBuilder.AppendLine($"{employee.FirstName} {employee.LastName} - {employee.JobTitle} - (${employee.Salary:F2})");
            }
            return stringBuilder.ToString();
        }

        public static string IncreaseSalaries(SoftUniContext context)
        {
            var employees = context.Employees
                .Where(e => e.Department.Name == "Engineering" || e.Department.Name == "Tool Design" || e.Department.Name == "Marketing" || e.Department.Name == "Information Services")
                .OrderBy(e => e.FirstName)
                .ThenBy(e => e.LastName)
                .ToList();

            foreach (var employee in employees)
            {
                employee.Salary *= 1.12m;
            }

            context.SaveChanges();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var employee in employees)
            {
                stringBuilder.AppendLine($"{employee.FirstName} {employee.LastName} (${employee.Salary:F2})");
            }
            return stringBuilder.ToString();
        }

        public static string GetLatestProjects(SoftUniContext context)
        {
            var projects = context.Projects
                .OrderByDescending(p => p.StartDate)
                .Take(10)
                .Select(p => new
                {
                    p.Name,
                    p.Description,
                    p.StartDate
                })
                .OrderBy(p => p.Name)
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var project in projects)
            {
                stringBuilder.AppendLine(project.Name);
                stringBuilder.AppendLine(project.Description);
                stringBuilder.AppendLine(project.StartDate.ToString("M/d/yyyy h:mm:ss tt"));
            }
            return stringBuilder.ToString();
        }

        public static string GetDepartmentsWithMoreThan5Employees(SoftUniContext context)
        {
            var departments = context.Departments
                .Select(d => new
                {
                    Name = d.Name,
                    Manager = $"{d.Manager.FirstName} {d.Manager.LastName}",
                    Employees = d.Employees.Select(e => new
                    {
                        e.FirstName,
                        e.LastName,
                        e.JobTitle
                    })
                    .OrderBy(f => f.FirstName)
                    .ThenBy(l => l.LastName)
                    .ToList()
                })
                .Where(e => e.Employees.Count > 5)
                .OrderBy(e => e.Employees.Count)
                .ThenBy(d => d.Name)
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var department in departments)
            {
                stringBuilder.AppendLine($"{department.Name} - {department.Manager}");
                foreach (var employee in department.Employees)
                {
                    stringBuilder.AppendLine($"{employee.FirstName} {employee.LastName} - {employee.JobTitle}");
                }
            }
            return stringBuilder.ToString();



        }

        public static string GetEmployee147(SoftUniContext context)
        {
            var employee = context.Employees
                .Where(e => e.EmployeeId == 147)
                .Select(e => new
                {
                    e.FirstName,
                    e.LastName,
                    e.JobTitle,
                    Projects = e.EmployeesProjects
                        .Select(ep => ep.Project)
                        .OrderBy(p => p.Name)
                        .Select(p => p.Name)
                        .ToList()
                })
                .FirstOrDefault();

            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.AppendLine($"{employee.FirstName} {employee.LastName} - {employee.JobTitle}");
            foreach (var project in employee.Projects)
            {
                stringBuilder.AppendLine(project);
            }
            return stringBuilder.ToString();
        }

        public static string GetAddressesByTown(SoftUniContext context)
        {

            var addresses = context.Addresses
                .Select(a => new
                {
                    Name = a.Town.Name,
                    AddressText = a.AddressText,
                    EmployeeCount = a.Employees.Count
                })
                .OrderByDescending(a => a.EmployeeCount)
                .ThenBy(a => a.Name)
                .ThenBy(a => a.AddressText)
                .Take(10)
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var address in addresses)
            {
                stringBuilder.AppendLine($"{address.AddressText}, {address.Name} - {address.EmployeeCount} employees");
            }
            return stringBuilder.ToString();
        }

        public static string GetEmployeesInPeriod(SoftUniContext context)
        {
            var employees = context.Employees
                .Select(e => new
                {
                    EmployeeId = e.EmployeeId,
                    FirstName = e.FirstName,
                    LastName = e.LastName,
                    ManagerFirstName = e.Manager.FirstName,
                    ManagerLastName = e.Manager.LastName,
                    Projects = e.EmployeesProjects
                        .Select(ep => ep.Project)
                        .Where(p => p.StartDate.Year >= 2001 && p.StartDate.Year <= 2003)
                        .Select(p => new
                        {
                            ProjectName = p.Name,
                            StartDate = p.StartDate.ToString("M/d/yyyy h:mm:ss tt"),
                            EndDate = p.EndDate.HasValue ? p.EndDate.Value.ToString("M/d/yyyy h:mm:ss tt") : "not finished"
                        })
                        .ToList()
                })
                .Take(10);

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var employee in employees)
            {
                stringBuilder.AppendLine($"{employee.FirstName} {employee.LastName} - Manager: {employee.ManagerFirstName} {employee.ManagerLastName}");
                foreach (var project in employee.Projects)
                {
                    stringBuilder.AppendLine($"--{project.ProjectName} - {project.StartDate} - {project.EndDate}");
                }
            }
            return stringBuilder.ToString();

        }

        public static string AddNewAddressToEmployee(SoftUniContext context)
        {
            var newAddress = new Address { AddressText = "Vitoshka 15", TownId = 4 };

            context.Addresses.Add(newAddress);

            var employee = context.Employees
                .FirstOrDefault(e => e.LastName == "Nakov");

            employee.Address = newAddress;

            context.SaveChanges();

            var employees = context.Addresses
                .OrderByDescending(a => a.AddressId)
                .Take(10)
                .Select(a => a.AddressText)
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var address in employees)
            {
                stringBuilder.AppendLine(address);
            }
            return stringBuilder.ToString();

        }

        public static string GetEmployeesFromResearchAndDevelopment(SoftUniContext context)
        {
            var employees = context.Employees
                .Where(e => e.Department.Name == "Research and Development")
                .OrderBy(e => e.Salary)
                .ThenByDescending(e => e.FirstName)
                .Select(e => new
                {
                    e.FirstName,
                    e.LastName,
                    DepartmentName = e.Department.Name,
                    e.Salary
                })
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var employee in employees)
            {
                stringBuilder.AppendLine($"{employee.FirstName} {employee.LastName} from {employee.DepartmentName} - ${employee.Salary:F2}");
            }
            return stringBuilder.ToString();
        }

        public static string GetEmployeesWithSalaryOver50000(SoftUniContext context)
        {
            var employees = context.Employees
                 .Where(e => e.Salary > 50000)
                 .OrderBy(e => e.FirstName)
                 .Select(e => new
                 {
                     e.FirstName,
                     e.Salary
                 })
                 .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var employee in employees)
            {
                stringBuilder.AppendLine($"{employee.FirstName} - {employee.Salary:F2}");
            }
            return stringBuilder.ToString();
        }

        public static string GetEmployeesFullInformation(SoftUniContext context)
        {
            var employees = context.Employees
                .OrderBy(e => e.EmployeeId)
                .Select(e => new
                {
                    FullName = e.FirstName + " " + e.LastName + " " + (e.MiddleName ?? ""),
                    e.JobTitle,
                    Salary = e.Salary.ToString("F2")
                })
                .ToList();

            StringBuilder stringBuilder = new StringBuilder();
            foreach (var employee in employees)
            {
                stringBuilder.AppendLine($"{employee.FullName} {employee.JobTitle} {employee.Salary}");
            }
            return stringBuilder.ToString();
        }
    }
}
