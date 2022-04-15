
var space = /\s/g;		//전체 문자 내 공백이 있는지 확인

	
var join = {
	tag_status : function( tag ) {		//tag의 상태를 확인할 함수 선언, 파라메터는 tag라는 변수로 설정
	
		var data = tag.val();			//tag에 입력된 값(==사용자가 input 칸에 입력한 값)을 data라는 변수로 할당
		tag = tag.attr('name');			//tag의 name 속성의 값을 확인 ex) id, pw, email 등등
		
		if(tag == 'id') return this.id_status(data);
		else if(tag == 'pw') return this.pw_status(data);
		else if(tag == 'pwcheck') return this.pw_ck_status(data);
	},
	
	id_status( id ){		
		var reg = /[^a-z0-9]/g;	//영어소문자+숫자 외 입력시	(^가 []안에 있으면 not)
		var lower=/[a-z]/g, digit=/[0-9]/g;
		
		//입력값이 없을 경우
		if(id == '') return this.common.empty;
		//입력값에 공백이 있을 경우(replace 안먹힌다 => 전역변수로 space 만들기)
		else if(id.match(space)) return this.common.space;
		//유효성 검사(영어 소문자 또는 숫자만 써야함)
		else if(reg.test(id)) return this.common.invalid;
		else if( !lower.test(id) || !digit.test(id)) 	return this.common.lack;
		//5자 이하 입력 여부 확인
		else if(id.length < 5) return this.common.min;
		//10자 넘어가면 안 되게
		else if(id.length > 10) return this.common.max;
		else return this.id.valid;
	},
	
	pw_status( pw ){		
		var reg = /[^A-Za-z0-9]/g;
		var lower=/[a-z]/g, digit=/[0-9]/g;
		
		if(pw == '') 													return this.common.empty;
		else if(pw.match(space)) 										return this.common.space;
		else if(reg.test(pw)) 											return this.common.invalid;
		else if(!lower.test(pw) || !digit.test(pw)) 	return this.common.lack;		//대소문자,숫자가 하나라도 없다면
		else if(pw.length < 5) 											return this.common.min;
		else if(pw.length > 10) 										return this.common.max;
		else 															return this.pw.valid;
	},
	
	pw_ck_status( pw_ck ){				
		if(pw_ck == '') 							return this.common.empty;
		else if(pw_ck == $('[name=pw]').val()) 		return this.pw.equal;
		else										return this.pw.notEqual;
	},
	
	
	//아이디 중복 체크
	id_usable : function (usable){
		if(usable)		return this.id.usable
		else			return this.id.unUsable
	},
	

	//아래는 기준을 설정한 부분 code = 상태 / desc = 설명
	id : { 		//id의 기준을 설정함 => valid(유효성 검사 통과했을 때) / invalid(유효성 검사 통과 실패)
		valid : { code : 'valid', desc : '중복확인 필요' },
		usable : { code : 'valid', desc : '사용 가능한 아이디입니다.' },
		unUsable : { code : 'invalid', desc : '이미 사용 중인 아이디입니다.' }
	},
	
	pw : {
		valid : { code : 'valid', desc : '사용 가능한 비밀번호입니다.' },
		equal : {code : 'valid', desc : '비밀번호가 일치합니다.'},
		notEqual : {code : 'invalid', desc : '비밀번호가 일치하지 않습니다.'}
	},
	
	common : {
		invalid : { code : 'invalid', desc : '영문(소문자), 숫자만 입력할 수 있습니다.'},
		empty : { code : 'invalid', desc : '입력하세요'},
		space : { code : 'invalid', desc : '공백 없이 입력하세요'},
		lack : { code : 'invalid', desc : '영문(소문자), 숫자를 모두 포함해야 합니다'},
		max : { code : 'invalid', desc : '최대 10자 이하로 입력하세요'},
		min : { code : 'invalid', desc : '최소 5자 이상 입력하세요'},
	}
}