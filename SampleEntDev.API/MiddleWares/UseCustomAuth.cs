using Microsoft.AspNetCore.Authorization;

namespace SampleEntDev.API.MiddleWares
{
    public static class UseCustomAuthExtension
    {
        /// <summary>
        /// Adds the <see cref="AuthorizationMiddleware"/> to the specified <see cref="IApplicationBuilder"/>, which enables authorization capabilities.
        /// <para>
        /// When authorizing a resource that is routed using endpoint routing, this call must appear between the calls to
        /// <c>app.UseRouting()</c> and <c>app.UseEndpoints(...)</c> for the middleware to function correctly.
        /// </para>
        /// </summary>
        /// <param name="app">The <see cref="IApplicationBuilder"/> to add the middleware to.</param>
        /// <returns>A reference to <paramref name="app"/> after the operation has completed.</returns>
        public static IApplicationBuilder UseCustomAuth(this IApplicationBuilder app)
        {
            if (app == null)
            {
                throw new ArgumentNullException(nameof(app));
            }

            VerifyServicesRegistered(app);

            return app.UseMiddleware<AuthorizationMiddleware>();
        }

        private static void VerifyServicesRegistered(IApplicationBuilder app)
        {
            
        }
    }
}
