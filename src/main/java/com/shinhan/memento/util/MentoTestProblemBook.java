package com.shinhan.memento.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shinhan.memento.dto.MentoProblemDTO;

public class MentoTestProblemBook {
	
	private static final List<MentoProblemDTO> PROBLEMS = new ArrayList<>();
	private static final Map<Integer, Integer> ANSWER_MAP = new HashMap<>();
	
	static {
	       PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(1)
	               .questionText("스택과 큐의 차이점은?")
	               .choices(List.of("스택은 FIFO, 큐는 LIFO", "스택은 LIFO, 큐는 FIFO", "둘 다 FIFO", "둘 다 LIFO"))
	               .build());
	           ANSWER_MAP.put(1, 1);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(2)
	               .questionText("JVM이란?")
	               .choices(List.of("자바 컴파일러", "자바 가상 머신", "자바 문법 검사기", "자바 API"))
	               .build());
	           ANSWER_MAP.put(2, 1);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(3)
	               .questionText("HTTP와 HTTPS의 차이는?")
	               .choices(List.of("HTTPS는 보안이 강화된 프로토콜이다", "HTTP는 암호화되고 HTTPS는 암호화되지 않는다", "둘 다 보안과 관련 없다", "HTTPS는 FTP의 하위 프로토콜이다"))
	               .build());
	           ANSWER_MAP.put(3, 0);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(4)
	               .questionText("오버라이딩과 오버로딩의 차이는?")
	               .choices(List.of("오버라이딩은 같은 클래스에서만 가능", "오버로딩은 메서드 이름도 달라야 함", "오버라이딩은 상속 관계에서 메서드 재정의", "오버로딩은 상속에서만 사용 가능"))
	               .build());
	           ANSWER_MAP.put(4, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(5)
	               .questionText("데이터베이스에서 인덱스의 역할은?")
	               .choices(List.of("데이터 저장 속도를 높인다", "데이터 삭제를 빠르게 한다", "데이터 검색 속도를 높인다", "데이터를 압축한다"))
	               .build());
	           ANSWER_MAP.put(5, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(6)
	               .questionText("프론트엔드와 백엔드의 차이는?")
	               .choices(List.of("프론트엔드는 서버 측, 백엔드는 클라이언트 측", "프론트엔드는 UI, 백엔드는 로직과 DB 처리", "프론트엔드는 보안 담당", "백엔드는 디자인 담당"))
	               .build());
	           ANSWER_MAP.put(6, 1);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(7)
	               .questionText("REST API의 특징은?")
	               .choices(List.of("상태를 항상 유지한다", "클라이언트-서버 결합도가 높다", "무상태성과 일관된 인터페이스", "오직 SOAP에서만 동작한다"))
	               .build());
	           ANSWER_MAP.put(7, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(8)
	               .questionText("Git의 사용 목적은?")
	               .choices(List.of("데이터베이스 백업", "코드 버전 관리", "서버 배포", "네트워크 암호화"))
	               .build());
	           ANSWER_MAP.put(8, 1);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(9)
	               .questionText("자바스크립트에서 '==='의 의미는?")
	               .choices(List.of("값만 비교", "주소만 비교", "값과 타입 모두 비교", "문법 오류"))
	               .build());
	           ANSWER_MAP.put(9, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(10)
	               .questionText("SQL에서 'SELECT * FROM users WHERE age >= 20'은 무엇을 의미?")
	               .choices(List.of("나이가 20보다 큰 사람만 출력", "나이가 20 이상인 모든 사용자 출력", "나이가 20 이하인 사용자 출력", "모든 사용자 출력"))
	               .build());
	           ANSWER_MAP.put(10, 1);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(11)
	               .questionText("C언어에서 포인터의 역할은?")
	               .choices(List.of("변수를 선언하는 방법", "데이터를 복사", "메모리 주소를 저장", "화면에 출력"))
	               .build());
	           ANSWER_MAP.put(11, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(12)
	               .questionText("다음 중 CSS에서 글자색을 지정하는 속성은?")
	               .choices(List.of("font", "text-color", "color", "background-color"))
	               .build());
	           ANSWER_MAP.put(12, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(13)
	               .questionText("브라우저가 HTML/CSS/JS를 해석하는 순서는?")
	               .choices(List.of("JS → CSS → HTML", "CSS → JS → HTML", "HTML → CSS → JS", "JS → HTML → CSS"))
	               .build());
	           ANSWER_MAP.put(13, 2);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(14)
	               .questionText("자바에서 예외(Exception)란?")
	               .choices(List.of("컴파일 오류", "런타임 중 발생 가능한 에러 처리 구조", "문법 경고", "디버깅 도구"))
	               .build());
	           ANSWER_MAP.put(14, 1);

	           PROBLEMS.add(MentoProblemDTO.builder()
	               .problemId(15)
	               .questionText("MVC 패턴에서 Controller의 역할은?")
	               .choices(List.of("데이터베이스 연결", "화면 출력", "요청을 받아 로직 처리 후 View로 연결", "모델을 시각화"))
	               .build());
	           ANSWER_MAP.put(15, 2);
	           
	           PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(16)
	        		    .questionText("객체지향 프로그래밍의 4대 특징 중 하나가 아닌 것은?")
	        		    .choices(List.of("캡슐화", "상속", "동기화", "다형성"))
	        		    .build());
	        		ANSWER_MAP.put(16, 2);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(17)
	        		    .questionText("HTML에서 하이퍼링크를 생성하는 태그는?")
	        		    .choices(List.of("img", "a", "p", "link"))
	        		    .build());
	        		ANSWER_MAP.put(17, 1);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(18)
	        		    .questionText("SQL에서 데이터를 삽입하는 명령어는?")
	        		    .choices(List.of("INSERT", "SELECT", "UPDATE", "DELETE"))
	        		    .build());
	        		ANSWER_MAP.put(18, 0);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(19)
	        		    .questionText("TCP와 UDP의 주요 차이점은?")
	        		    .choices(List.of("TCP는 비연결형, UDP는 연결형", "TCP는 신뢰성이 높고, UDP는 빠르다", "둘 다 신뢰성이 동일", "UDP는 파일 전송에 적합"))
	        		    .build());
	        		ANSWER_MAP.put(19, 1);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(20)
	        		    .questionText("Java에서 배열의 인덱스는 어디서 시작하는가?")
	        		    .choices(List.of("1", "0", "-1", "사용자 지정 가능"))
	        		    .build());
	        		ANSWER_MAP.put(20, 1);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(21)
	        		    .questionText("자바스크립트에서 변수를 선언할 수 없는 키워드는?")
	        		    .choices(List.of("var", "let", "const", "define"))
	        		    .build());
	        		ANSWER_MAP.put(21, 3);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(22)
	        		    .questionText("컴파일러가 하는 일은?")
	        		    .choices(List.of("HTML 문서를 해석", "소스 코드를 기계어로 번역", "CSS를 렌더링", "파일을 암호화"))
	        		    .build());
	        		ANSWER_MAP.put(22, 1);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(23)
	        		    .questionText("Python의 리스트와 튜플의 주요 차이점은?")
	        		    .choices(List.of("리스트는 변경 가능, 튜플은 변경 불가", "튜플만 반복 가능", "리스트는 키-값 저장", "튜플은 가변 길이"))
	        		    .build());
	        		ANSWER_MAP.put(23, 0);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(24)
	        		    .questionText("오라클에서 기본 키를 생성하는 키워드는?")
	        		    .choices(List.of("FOREIGN KEY", "UNIQUE", "PRIMARY KEY", "CHECK"))
	        		    .build());
	        		ANSWER_MAP.put(24, 2);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(25)
	        		    .questionText("자바에서 클래스는 무엇인가?")
	        		    .choices(List.of("변수 저장소", "메서드만 정의하는 곳", "객체를 생성하기 위한 틀", "조건문 처리"))
	        		    .build());
	        		ANSWER_MAP.put(25, 2);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(26)
	        		    .questionText("브라우저의 개발자 도구 단축키는?")
	        		    .choices(List.of("F11", "F2", "F12", "F1"))
	        		    .build());
	        		ANSWER_MAP.put(26, 2);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(27)
	        		    .questionText("Spring Framework의 특징이 아닌 것은?")
	        		    .choices(List.of("의존성 주입", "AOP 지원", "JVM 없이 실행 가능", "MVC 구조 제공"))
	        		    .build());
	        		ANSWER_MAP.put(27, 2);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(28)
	        		    .questionText("HTTP 요청 중 데이터를 서버에 제출할 때 사용하는 메서드는?")
	        		    .choices(List.of("GET", "POST", "PUT", "DELETE"))
	        		    .build());
	        		ANSWER_MAP.put(28, 1);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(29)
	        		    .questionText("도메인 네임 시스템(DNS)의 역할은?")
	        		    .choices(List.of("IP 주소를 도메인으로 변환", "브라우저 캐시를 삭제", "네트워크 속도 측정", "서버에 데이터 저장"))
	        		    .build());
	        		ANSWER_MAP.put(29, 0);

	        		PROBLEMS.add(MentoProblemDTO.builder()
	        		    .problemId(30)
	        		    .questionText("React에서 상태 관리를 위한 훅은?")
	        		    .choices(List.of("useState", "useFetch", "useQuery", "useLoop"))
	        		    .build());
	        		ANSWER_MAP.put(30, 0);
	        		
	        		PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(31)
	        			    .questionText("자바에서 static 키워드의 의미는?")
	        			    .choices(List.of("인스턴스 변수", "정적 변수 또는 메서드", "접근 제한자", "예외 처리 키워드"))
	        			    .build());
	        			ANSWER_MAP.put(31, 1);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(32)
	        			    .questionText("다음 중 HTTP 상태 코드 404의 의미는?")
	        			    .choices(List.of("성공", "리다이렉트", "페이지를 찾을 수 없음", "서버 에러"))
	        			    .build());
	        			ANSWER_MAP.put(32, 2);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(33)
	        			    .questionText("다음 중 컴퓨터의 RAM에 대한 설명으로 옳은 것은?")
	        			    .choices(List.of("비휘발성 저장장치", "운영체제가 설치되는 공간", "임시 저장장치로 전원이 꺼지면 데이터가 사라진다", "하드디스크보다 느리다"))
	        			    .build());
	        			ANSWER_MAP.put(33, 2);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(34)
	        			    .questionText("Java에서 인터페이스는 어떤 역할을 하는가?")
	        			    .choices(List.of("데이터 저장소 제공", "다형성을 위한 설계 틀 제공", "예외 처리를 담당", "UI 디자인 도구"))
	        			    .build());
	        			ANSWER_MAP.put(34, 1);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(35)
	        			    .questionText("CSS에서 요소를 숨기는 방법은?")
	        			    .choices(List.of("display: none;", "color: white;", "visibility: visible;", "position: absolute;"))
	        			    .build());
	        			ANSWER_MAP.put(35, 0);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(36)
	        			    .questionText("오버로딩은 언제 발생하는가?")
	        			    .choices(List.of("상속 시 메서드 재정의", "동일한 이름의 메서드를 파라미터 다르게 선언", "예외 처리 시", "변수 초기화"))
	        			    .build());
	        			ANSWER_MAP.put(36, 1);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(37)
	        			    .questionText("Spring에서 의존성 주입(DI)은 무엇을 의미하는가?")
	        			    .choices(List.of("객체의 생성과 소멸을 자동으로 처리", "객체 간의 결합도를 높임", "객체에 필요한 의존 객체를 외부에서 주입", "데이터베이스 연결을 담당"))
	        			    .build());
	        			ANSWER_MAP.put(37, 2);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(38)
	        			    .questionText("Git에서 변경 사항을 로컬 저장소에 반영하는 명령어는?")
	        			    .choices(List.of("git push", "git fetch", "git commit", "git clone"))
	        			    .build());
	        			ANSWER_MAP.put(38, 2);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(39)
	        			    .questionText("HTML에서 입력 필드를 만들 때 사용하는 태그는?")
	        			    .choices(List.of("input", "form", "span", "table"))
	        			    .build());
	        			ANSWER_MAP.put(39, 0);

	        			PROBLEMS.add(MentoProblemDTO.builder()
	        			    .problemId(40)
	        			    .questionText("자바스크립트에서 배열의 길이를 얻는 방법은?")
	        			    .choices(List.of("array.size", "array.count()", "array.length", "array.getLength()"))
	        			    .build());
	        			ANSWER_MAP.put(40, 2);
	}

	public static List<MentoProblemDTO> getPROBLEMS() {
		return PROBLEMS;
	}

	public static Map<Integer, Integer> getANSWER_MAP() {
		return ANSWER_MAP;
	}
	
	public static List<MentoProblemDTO> getRandomProblems(int count) {
	    List<MentoProblemDTO> shuffled = new ArrayList<>(PROBLEMS);
	    Collections.shuffle(shuffled);
	    return shuffled.subList(0, Math.min(count, shuffled.size()));
	}
}
