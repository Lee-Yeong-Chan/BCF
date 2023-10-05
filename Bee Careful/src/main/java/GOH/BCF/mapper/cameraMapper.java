package GOH.BCF.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import GOH.BCF.entity.cameraDTO;
@Mapper
public interface cameraMapper {
	@Select("Select * from t_camera where user_id=#{user_id}")
	public List<cameraDTO> allcamera(String user_id);
}
