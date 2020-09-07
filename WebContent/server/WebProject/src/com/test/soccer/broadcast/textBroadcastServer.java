package com.test.soccer.broadcast;

import java.io.IOException;
import java.util.ArrayList;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/board/textbroadcastserver")
public class textBroadcastServer {
	private static ArrayList<Session> sessions=new ArrayList<Session>();
	
	//클라이언트(브라우저)가 연결을 요청 + 접속
	@OnOpen
	public void handleOpen(Session userSession) {
		System.out.println("클라이언트 접속 성공");
		sessions.add(userSession);//접속자 관리
	}
	
	//클라이언트가 연결을 종료 요청 + 해제
	@OnClose
	public void handleClose(Session uesrSession) {
		System.out.println("클라이언트 접속 종료");
		//접속을 끊은 유저의 세션을 제거한다.
		sessions.remove(uesrSession);
	}
	
	//통신 중 에러 발생
	@OnError
	public void handlerError(Throwable t) {
		t.printStackTrace();
	}
	
	//클라이언트가 서버에게 메시지를 전달
	@OnMessage
	public void handleMessage(String message,Session userSession) {
		
		//홍길동#안녕하세요.
		/*
		 ws.send(${leaguegame_seq}+"#"
      					+playerEntry_seq+"#"
      					+broadcastact_seq+"#"
      					+tT);
		 
		 
		 */
		System.out.println(message);
		String[] list=message.split("#");
		String leagueGame_seq=list[0];
		String playerEntry_seq=list[1];
		String broadcastAct_seq=list[2];
		String time=list[3];
		String backnumber=list[4];
		String playername=list[5];
		String action=list[6];
		String playerteam=list[7];
		
		String send=String.format("[%s]분 %sFc (%s)번 %s 선수 %s  "
									,time,playerteam,backnumber,playername,action);
		
		BroadCastDAO2 dao=new BroadCastDAO2();
		BroadcastDTO1 dto=new BroadcastDTO1();
		dto.setLeagueGame_seq(leagueGame_seq);
		dto.setPlayerEntry_seq(playerEntry_seq);
		dto.setBroadcastAct_seq(broadcastAct_seq);
		dto.setTime(time);
		int result=dao.updateTextBroadcast(dto);
		System.out.println(result==1?"전송 성공":"전송 실패");
		if(result==0) {
			try {
				userSession.getBasicRemote().sendText("데이터 전송에 실패했습니다");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			//한 사람이 보낸 메시지를 다른 사람에게 전달
			for(Session session : sessions) {
				
					try {
						session.getBasicRemote().sendText(send);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}//for
		}//else
		
		
	}//onmessage

}//tbs server
