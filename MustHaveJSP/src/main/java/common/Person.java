package common;


// default 패키지 이외의 패키지 (규약 1번)

public class Person {
	private String name; // private 멤버 변수(규약 2번)
	private int age;	 // private 멤버 변수(규약 2번)
	
	public Person() {} 	// 기본 생성자가 있어야 한다. (규약 3번)
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	
	// 게터 세터가 있어야 한다. (규약 4번)
	// 게터 세터 접근 지정자는 public 이어야 한다. (규약 5번)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	
	
}
