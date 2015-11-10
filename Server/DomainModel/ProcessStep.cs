using System;
using System.Linq;

namespace DomainModel
{
    public abstract class ProcessStep
    {
        public static ProcessStep Create(string typeName, bool isMandatory, string parameters)
        {
            // TODO: cache step types
            var stepType = Type.GetType(typeName);
            if (stepType == null)
                throw new Exception("Unable to find ProcessStep type: " + typeName);

            var ctor = stepType.GetConstructors().First();
            var result = ctor.GetParameters().Any()
                    ? (ProcessStep)ctor.Invoke(new object[] {parameters})
                    : (ProcessStep)ctor.Invoke(new object[] {});
            result.Mandatory = isMandatory;
            return result;
        }

        public abstract string Name { get; }
        public bool Mandatory { get; set; }
    }
}