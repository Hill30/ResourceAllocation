using System;
using System.ComponentModel;
using DomainModel;
namespace Application.Common
{
    public static class Helper
    {
        private const string INVALID_PERSON_TYPE = "Valid values are C (for Client) or E (for Employee)";
        private const string INVALID_SORT_ORDER = "Valid values are ASC or DESC";

        public static PersonType GetPersonType(string personType)
        {
            if (personType == null)
                throw new ArgumentNullException("personType");

            if (String.IsNullOrWhiteSpace(personType))
                throw new ArgumentOutOfRangeException("personType", personType, INVALID_PERSON_TYPE);

            switch (personType.ToUpper())
            {
                case "C": return PersonType.Client;
                case "E": return PersonType.Employee;
                default:
                    throw new ArgumentOutOfRangeException("personType", personType, INVALID_PERSON_TYPE);
            }
        }

        public static string PersonTypeToString(PersonType personType)
        {
            switch (personType)
            {
                case PersonType.Employee: return "E";
                case PersonType.Client: return "C";
                default:
                    throw new ArgumentOutOfRangeException("personType");
            }
        }


        public static string CallTypeToString(CallType callType)
        {
            switch (callType)
            {
                case CallType.Any:
                    return "A";
                case CallType.Inbound:
                    return "I";
                case CallType.Outbound:
                    return "O";
                default:
                    throw new ArgumentOutOfRangeException("callType");
            }
        }

        public static string CallerTypeToString(CallerType callerType)
        {
            switch (callerType)
            {
                case CallerType.Any:
                    return "A";
                case CallerType.Employee:
                    return "E";
                case CallerType.Client:
                    return "C";
                case CallerType.Operator:
                    return "O";
                default:
                    throw new ArgumentOutOfRangeException("callerType");
            }
        }

        public static ListSortDirection GetSortDirection(string sortOrder, ListSortDirection? defaultDirection = null)
        {
            if (sortOrder == null)
                throw new ArgumentNullException("sortOrder");

            if (String.IsNullOrWhiteSpace(sortOrder))
            {
                if (defaultDirection == null)
                    throw new ArgumentOutOfRangeException("sortOrder", sortOrder, INVALID_SORT_ORDER);
                return defaultDirection.Value;
            }

            switch (sortOrder.ToUpper())
            {
                case "ASC":
                case "ASCENDING":
                    return ListSortDirection.Ascending;
                case "DESC":
                case "DESCENDING":
                    return ListSortDirection.Descending;
                default:
                    throw new ArgumentOutOfRangeException("sortOrder", sortOrder, INVALID_SORT_ORDER);
            }
        }
    }
}