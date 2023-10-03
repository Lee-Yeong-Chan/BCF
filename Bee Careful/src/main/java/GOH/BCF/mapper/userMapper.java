package GOH.BCF.mapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import GOH.BCF.entity.UserDTO;
@Mapper
public interface userMapper {
	@Select("select * from t_user where user_id=#{user_id} and user_pw=#{user_pw}")
	public UserDTO login(UserDTO DTO);
	@Insert("insert into t_user values (#{user_id},#{user_pw},#{user_name},#{user_email},#{user_phone},#{user_addr})")
	public void join(UserDTO DTO);
	@Select("select count(*) from t_user where user_id=#{user_id}")
	public Integer check(String user_id);
}