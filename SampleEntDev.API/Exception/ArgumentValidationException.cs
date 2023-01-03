using System.Net;

namespace SampleEntDev.API.Exception
{
    [Serializable]
    public class ArgumentValidationException : System.Exception
    {
        private const int _statusCode = (int)HttpStatusCode.BadRequest;

        public ArgumentValidationException(List<string> errors)
        {
            MessageProps.AddRange(errors);
            Message = string.Join(Environment.NewLine, errors);
        }

        public int StatusCode => _statusCode;
        public List<string> MessageProps { get; } = new();
        public override string Message { get; }
    }

}
