namespace SampleEntDev.API.Filter
{
    /// <summary>
    /// It is used for classes or methods that you do not want to be authorized in the code. Be careful when using.
    /// </summary>
    [AttributeUsage(System.AttributeTargets.Class | AttributeTargets.Method)]
    public class SkipAuthorization : System.Attribute
    {
    }
}