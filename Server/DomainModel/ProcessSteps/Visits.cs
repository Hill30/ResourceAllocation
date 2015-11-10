using System;

namespace DomainModel.ProcessSteps
{
    public class Visits : ProcessStep
    {
        public Visits(string parameters)
        {
            SelectionType = (SelectionType)Enum.Parse(typeof(SelectionType), parameters);
        }

        public override string Name
        {
            get { return "visits"; }
        }

        public SelectionType SelectionType { get; set; }
    }
}