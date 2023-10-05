package GOH.BCF.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import GOH.BCF.entity.alarmDTO;
@Mapper
public interface alarmMapper {
	@Select("select * from t_alarm where camera_idx in (select camera_idx from t_camera where user_id=#{user_id})")
	public List<alarmDTO> userallalarm(String user_id);
	@Select("Select * from t_alarm")
	public List<alarmDTO> allalarm();
	@Delete("delete from t_alarm where alarm_idx=#{alarm_idx}")
	public void alarmdelete(int idx);
	@Insert("insert into t_alarm values (null,sysdate(),#{alarm_content},#{camera_idx})")
	public void alarminsert(alarmDTO DTO);
}