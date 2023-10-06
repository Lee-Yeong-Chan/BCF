package GOH.BCF.entity;
public class cameraDTO {
	private int camera_idx;
	private String user_id;
	private String camera_status;
	private int alarm_status;
	public int getCamera_idx() {
		return camera_idx;
	}
	public void setCamera_idx(int camera_idx) {
		this.camera_idx = camera_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCamera_status() {
		return camera_status;
	}
	public void setCamera_status(String camera_status) {
		this.camera_status = camera_status;
	}
	public int getAlarm_status() {
		return alarm_status;
	}
	public void setAlarm_status(int alarm_status) {
		this.alarm_status = alarm_status;
	}
}