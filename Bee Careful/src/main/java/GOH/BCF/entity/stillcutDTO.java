package GOH.BCF.entity;
import org.springframework.web.multipart.MultipartFile;
public class stillcutDTO {
	private int stillcut_idx;
	private int camera_idx;
	private String stillcut_date;
	private String stillcut_name;
	private MultipartFile Stillcut_image;
	public int getStillcut_idx() {
		return stillcut_idx;
	}
	public void setStillcut_idx(int stillcut_idx) {
		this.stillcut_idx = stillcut_idx;
	}
	public int getCamera_idx() {
		return camera_idx;
	}
	public void setCamera_idx(int camera_idx) {
		this.camera_idx = camera_idx;
	}
	public String getStillcut_date() {
		return stillcut_date;
	}
	public void setStillcut_date(String stillcut_date) {
		this.stillcut_date = stillcut_date;
	}
	public String getStillcut_name() {
		return stillcut_name;
	}
	public void setStillcut_name(String stillcut_name) {
		this.stillcut_name = stillcut_name;
	}
	public MultipartFile getStillcut_image() {
		return Stillcut_image;
	}
	public void setStillcut_image(MultipartFile stillcut_image) {
		Stillcut_image = stillcut_image;
	}
}