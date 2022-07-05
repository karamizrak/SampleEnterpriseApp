using AutoMapper;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Repositories.Schemas.Management;
using SampleEntDev.Core.Services.Schemas.Management;

namespace SampleEntDev.Service.Services.Schemas.Management
{
    public class UserService : GenericService<User>, IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;
        public UserService(IGenericRepository<User> repository, IUnitOfWork unitOfWork, IUserRepository userRepository, IMapper mapper) : base(repository, unitOfWork)
        {
            _userRepository = userRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;   
        }

        public async Task<GResponseDto<UserDto>> FindByEmailandPassword(string email, string password)
        {
            var user = await _userRepository.FindByEmailandPassword(email, password);

            if (user != null)
            {
                var data = _mapper.Map<UserDto>(user);
                return GResponseDto<UserDto>.Success(200, data);
            }
            
            return GResponseDto<UserDto>.Fail(404,"Not found user.");
        }

        public async Task<GResponseDto<UserDto>> GetUserByRefreshToken(string refreshToken)
        {
            var user = await _userRepository.GetUserByRefreshToken(refreshToken);

            if (user != null)
            {
                var data = _mapper.Map<UserDto>(user);
                return GResponseDto<UserDto>.Success(200, data);
            }
            return GResponseDto<UserDto>.Fail(404, "Could not find a user for Refresh Token.");
        }

        public async Task RemoveRefreshToken(int userId)
        {
            try
            {
                await _userRepository.RemoveRefreshToken(userId);
                await _unitOfWork.CommitAsync();
            }
            catch (Exception)
            {
                //TODO:Logging will be done
                throw;
            }
        }

        public async Task SaveRefreshToken(int userId, string refreshToken, DateTime refreshTokenExpiration)
        {
            try
            {
                await _userRepository.SaveRefreshToken(userId, refreshToken, refreshTokenExpiration);
                await _unitOfWork.CommitAsync();
            }
            catch (Exception)
            {
                //TODO:Logging will be done
                throw;
            }
        }
    }
}
