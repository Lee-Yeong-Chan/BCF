package GOH.BCF.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import GOH.BCF.entity.alarmDTO;
@Mapper
public interface alarmMapper {
	@Select("select * from t_alarm where camera_idx in (select camera_idx from t_camera where user_id=#{user_id})")
	public List<alarmDTO> allalarm(String user_id);
}