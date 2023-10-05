package GOH.BCF.entity;
public class alarmDTO {
	private int alarm_idx;
	private String alarm_date;
	private String alarm_content;
	private int camera_idx;
	public int getAlarm_idx() {
		return alarm_idx;
	}
	public void setAlarm_idx(int alarm_idx) {
		this.alarm_idx = alarm_idx;
	}
	public String getAlarm_date() {
		return alarm_date;
	}
	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}
	public String getAlarm_content() {
		return alarm_content;
	}
	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}
	public int getCamera_idx() {
		return camera_idx;
	}
	public void setCamera_idx(int camera_idx) {
		this.camera_idx = camera_idx;
	}
}