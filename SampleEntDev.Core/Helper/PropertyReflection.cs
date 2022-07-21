using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Helper
{
    public class PropertyReflection
    {
        public static void SetValue(object container, string propertyName, object value)
        {
            var propertyInfo = container.GetType().GetProperty(propertyName);
            propertyInfo?.SetValue(container, Convert.ChangeType(value, propertyInfo.PropertyType), null);
        }

        public static object? GetValue(object container, string propertyName)
        {
            return container.GetType().GetProperty(propertyName)?.GetValue(container, null);
        }
    }
}