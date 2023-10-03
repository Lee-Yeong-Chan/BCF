package GOH.BCF.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import GOH.BCF.entity.UserDTO;
@Mapper
public interface userMapper {
	@Select("select * from t_user where user_id=#{user_id} and user_pw=#{user_pw}")
	public UserDTO login(UserDTO DTO);
	@Insert("insert into t_user values (#{user_id},#{user_pw},#{user_name},#{user_email},#{user_phone},#{user_addr})")
	public void join(UserDTO DTO);
	@Select("select count(*) from t_user where user_id=#{user_id}")
	public Integer check(String user_id);
	@Update("update t_user set user_pw=#{user_pw} where user_id=#{user_id}")
	public void updatePw(UserDTO DTO);	
	@Update("update t_user set user_name=#{user_name} where user_id=#{user_id}")
	public void updateName(UserDTO DTO);
	@Update("update t_user set user_email=#{user_email} where user_id=#{user_id}")
	public void updateEmail(UserDTO DTO);
	@Update("update t_user set user_phone=#{user_phone} where user_id=#{user_id}")
	public void updatePhone(UserDTO DTO);
	@Update("update t_user set user_addr=#{user_addr} where user_id=#{user_id}")
	public void updateAddr(UserDTO DTO);
	@Select("select * from t_user where not user_id in ('admin')")
	public List<UserDTO> userList();
	@Delete("Delete from t_user where user_id=#{user_id}")
	public void Delete(String user_id);
}