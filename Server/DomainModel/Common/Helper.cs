using System;

namespace DomainModel.Common
{
    public static class Helper
    {
        public static string GetPersonName(Person person)
        {
            string result = null;
            if (person == null)
                return null;

            if (!String.IsNullOrWhiteSpace(person.LastName))
            {
                result = person.LastName;
                if (!String.IsNullOrWhiteSpace(person.FirstName))
                    result = result + ", " + person.FirstName;
            }
            else if (!String.IsNullOrWhiteSpace(person.FirstName))
                result = person.FirstName;
            return result;
        }         
    }
}