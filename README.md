# Hello, stranger!
이 어플리케이션은 외국인들을 위한 메뉴판 번역 서비스입니다.
더 이상 외국인들은 엉터리 번역과 알아볼 수 없는 메뉴를 볼 필요 없습니다.
길거리 밖에서도 비콘이 있는 매장이라면 메뉴를 쉽게 접할 수 있습니다.

>외국인에게는모바일(Android)을,
매장주인에게는 매장관리를 위한 웹(web)이 제공됩니다.
* [모바일](https://github.com/sejinq/HelloStranger)
* [웹](https://github.com/dobeeisfree/HelloStranger)
* [동영상](https://www.youtube.com/watch?v=7hpoo1Dh_qI)

<br>
## WEB
<img src="http://cfs.tistory.com/custom/blog/65/655698/skin/images/home.png">

웹 사이트 프로젝트는 매장 주인을 위해 만들어졌습니다.  
매장 주인은 오너로서 가입을 할 수 있고,
하나 이상의 매장을 등록하여 관리할 수 있습니다.

매장에서 사용하는 비콘의 uuid와, 매장의 메뉴들을 입력합니다.
한글로 입력하면, 데이터베이스에는 4가지 언어로 저장이 됩니다.

퀵메뉴판은 총 2개만 설정할 수 있으며, 설정된 후
모바일에서는 설정된 메뉴가 퀵메뉴판으로 보여집니다.

<br>
## Database

번역 테이블에는 OpenAPI인 [TourAPI3.0](http://api.visitkorea.or.kr/search/tourTermsList.do)으로 번역풀을 만들었습니다.  
현재 번역풀은 `음식명`만 지원하며,  
나머지 번역풀은 직접 데이터를 넣었습니다.
언어는 한국어, 영어, 중국어, 일어 총 4가지 언어가 지원됩니다.

메뉴명, 맛, 재료, 조리법에는 로컬서치를 구현하여
기존 번역테이블을 검색할 수 있습니다.

<img src="http://cfile22.uf.tistory.com/image/2770014D584AB8E0169E9D">
* [TourAPI3.0 에서 추출한 데이터](https://github.com/dobeeisfree/HelloStranger/blob/master/db/local-sql/foodnames.csv)
* [mysql create table sql](https://github.com/dobeeisfree/HelloStranger/blob/master/db/structure.sql)

<br>
## Development
  * Ruby 2.3.1
  * Rails 4.2.6
  * front-end-development-framework : semantic-ui
  * MySQL
  * [테스트 서버](https://hello-stranger-dobeeisfree.c9users.io/)


<br>
## Api
* [Server API](https://github.com/dobeeisfree/HelloStranger/wiki/Server-API)
안드로이드가 서버로부터 값을 요구할 때 보는 문서를 작성하였습니다.

<br>
## Wiki
* [For api test user (c9)](https://github.com/dobeeisfree/HelloStranger/wiki/For-api-test-user-(c9))
* [Server API](https://github.com/dobeeisfree/HelloStranger/wiki/Server-API)
* [데이터베이스 스키마](https://github.com/dobeeisfree/HelloStranger/wiki/%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%8A%A4%ED%82%A4%EB%A7%88)

<hr>

__contributor [dobbeeisfree](https://github.com/dobeeisfree)__
