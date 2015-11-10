using System;

namespace DomainModel.ProcessSteps
{
    public class Calendar : ProcessStep
    {
        public Calendar(string parameters)
        {
            SelectionType = (SelectionType)Enum.Parse(typeof(SelectionType), parameters);
        }

        public override string Name
        {
            get { return "dates"; }
        }

        public SelectionType SelectionType { get; set; }
    }
}