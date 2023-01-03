using Autofac.Core;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using SampleEntDev.Core.Security;

namespace SampleEntDev.API.Config
{
    public static class AuthenticationDiConfig
    {
        public static void AddAuthenticationConfig(this WebApplicationBuilder builder)
        {
            TokenOptions tokenOptions = builder.Configuration.GetSection("TokenOptions").Get<TokenOptions>() ?? throw new InvalidOperationException("Token options isn't reading!!!");

            builder.Services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(jwtBearerConfig =>
            {
                jwtBearerConfig.SaveToken = true;
                jwtBearerConfig.RequireHttpsMetadata = false;
                jwtBearerConfig.TokenValidationParameters =
                    new Microsoft.IdentityModel.Tokens.TokenValidationParameters()
                    {
                        ValidateAudience = true,
                        ValidateIssuer = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = tokenOptions.Issuer,
                        ValidAudience = tokenOptions.Audience,
                        IssuerSigningKey = SignHandler.GetSecurityKey(tokenOptions.SecretKey),
                        ClockSkew = TimeSpan.Zero
                    };
            });
        }
    }
}
