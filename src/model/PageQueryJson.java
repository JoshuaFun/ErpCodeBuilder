package model;

public class PageQueryJson extends BaseProc{
	private Boolean storePermission = false;
	private Boolean pluPermission = false;
	
	public Boolean getStorePermission() {
		return storePermission;
	}
	public void setStorePermission(Boolean storePermission) {
		this.storePermission = storePermission;
	}
	public Boolean getPluPermission() {
		return pluPermission;
	}
	public void setPluPermission(Boolean pluPermission) {
		this.pluPermission = pluPermission;
	}
}
