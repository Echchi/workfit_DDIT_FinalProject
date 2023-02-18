package kr.or.workFit.controller.commons;

public class FilePath {
	/**
	 * 톰캣 서버 경로를 내 프로젝트 절대 경로로 반환하는 메소드
	 * @param path 서버경로 ! .metadata/.plugins/등 의 경로임
	 * @return 내프로젝트 webapp안의 resources안의 경로를 반환함
	 */
	public String getRealPath(String path){
        String savePath = "";
        if(path.contains("/")){
            savePath = path.replace(".metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/", "");
        }
        if(path.contains("\\")){
            savePath = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "");
        }
        int num = savePath.indexOf("resources");
        String newpath = savePath.substring(0, num-1) + "/src/main/webapp/" + savePath.substring(num);
        return newpath;
    }
}
