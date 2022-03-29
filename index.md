## 🛳 BAETAVERSE 프로젝트에 오신 것을 환영합니다!



### 1. 프로젝트 소개



#### 개요

* 화물의 주인과 운송 주선업자 사이의 정보 비대칭성을 줄여서 화물의 주인에게 합리적인 소규모 화물 물류비 견적을 제공해주는 플랫폼

  

#### 제안 배경

* 물류 서비스를 이용하고자 하는 **소비자**로 **화물의 주인 (화주)**, 물류 서비스를 제공해주는 **공급자**로 포워딩 서비스를 제공하는 **운송 주선업자**가 있음

* 코로나-19 팬데믹으로 인한 물류 대란으로 소규모 화물 운송 서비스에 대한 수요가 증가하고 있음

* 기존의 물류 서비스 이용방식에서 소비자가 소규모 화물의 수출입 물류비 견적 정보에 접근함에 있어 정보의 비대칭성이 존재함

* 정보의 비대칭성으로 인해 소비자가 물류 서비스를 이용하기위해 적은 선택지를 위해 많은 시간과 높은 비용을 지불해야 하는 비효율성이 존재함

* 공급자 관점에서도 필드 영업시 물리적으로 움직여서 고객을 영입한다는 측면에서 비효율성이 존재함

* 하나의 플랫폼에서 소비자와 공급자 사이에 견적 정보를 교류할 수 있도록 구현하여 정보의 비대칭성으로 발생되는 비용의 비효율성을 개선하고자 함

* 따라서 화주와 운송 주선업자 사이에 물류비 견적을 비교할 수 있는 플랫폼을 제안하게 되었음

  

#### 주요 서비스

1. **소규모 수출 화주 관점 (소비자)**

   - 소규모 화물에 대한 배송 견적 요청 정보를 입력할 수 있음
   - 육, 해, 공 상의 물류 서비스 연동 요청이 가능함
   - 인코텀즈 기준의 화물 인도 세부 조건을 손쉽게 명시할 수 있음
   - 운송 주선 업자가 제안한 견적을 하나의 플랫폼에서 비교 및 선택하여 정보의 비대칭성을 해소할 수 있음
   - 선호하는 견적의 경우 운송 주선업자와 Direct Message 형태의 상담을 진행할 수 있음
   - 서비스 공급자에 대한 평가를 진행할 수 있음

   

2. **포워딩 서비스 제공자 관점 (공급자)**

   - 소비자 영입을 하나의 플랫폼을 통해 관리함으로써 영업 및 관리 비용을 낮출 수 있음
   - 수주 받고 싶은 세부 요청 견적서 명단을 확인할 수 있음
   - 소비자가 요청한 견적 정보에 대해 응수할 수 있는 세부 요견을 제안할 수 있음
   - 소비자가 요청한 Direct Message 형태의 상담 요청에 응답할 수 있음
   - 사용자가 수락한 견적 요청에 대해 실제로 진행시킬 수 있음
   - 소비자가 남긴 평가에 기반하여 공급자의 신용을 증명할 수 있음



#### 적용 기술

1. **기술 개요**

   - Express 등의 오픈소스 프레임워크를 활용한 Server 구현

   - 정부 공공 데이터 API 연동을 통한 물류 지식 서비스 제공

   - macOS, iOS 크로스 플랫폼 지원 가능한 Front-End Application 개발

   - NLP 기술에 기반한 HSCode 추천 서비스 구현

   - 사용자 권한에 대응하여 알맞은 서비스를 받을 수 있도록 데이터 베이스 스키마 설계

     

2. **기술 배치 도식화**

   ![Picture1](https://user-images.githubusercontent.com/25794814/160412622-17cab6b6-0c74-46e5-9767-9bad7839a15d.png)

   

3. **주요 기능**

   | 구분 | 기능                       | 설명                                                         |
   | ---- | -------------------------- | ------------------------------------------------------------ |
   | S/W  | 모바일 / 웹 User Interface | 소규모 화물 물류 견적을 관리할 수 있도록 모바일과 컴퓨터 환경을 지원하는 사용자 인터페이스 어플리케이션을 개발함. |
   | S/W  | HSCode 추천 서비스         | 사용자가 코드의 일부를 입력하거나 물건의 정보를 입력했을때 맵핑되는 HSCode 정보를 손쉽게 찾을 수 있도록 추천 서비스를 개발함. |
   | S/W  | 포워더 견적 연동 서비스    | 포워더 회사별 견적 연동 서비스를 제공하여 사용자가 배타버스 플랫폼을 통해 견적을 통합 관리할 수 있도록 개발함. |
   | S/W  | DM 채팅 서비스             | 소비자와 공급자 사이에 소규모 화물 물류 견적에 대한 세부 상담을 받을 수 있는 채팅 서비스를 개발함. |

   

#### 기대 효과

1. **작품의 기대 효과**

   - 소비자 관점에 공급자의 견적을 하나의 플랫폼에서 통합 관리하여 제공하여 서의 물류 비용을 절감하고 물류 업무 수행 시간 줄일 수 있음

   - 공급자 관점에서 소규모 화물 소비자를 유연하게 확보할 수 있어 영업 및 운영 비용의 비효율성을 개선할 수 있음

   - 물류 지식 컨텐츠를 통합적으로 소비할 수 있는 플랫폼을 통해 사용자들의 해상 물류 산업 접근성을 완화시킬 수 있음

   - 수출입 물류를 확장하고 비효율성을 개선하여 대한민국의 국제적 해상 물류 산업에서의 경쟁력을 확보할 수 있음

   - 소비자 관점에서 공급자의 신뢰도를 확인하여 선택할 수 있음

     

2. **활용 분야**

   - 중소기업의 소규모 물류 처리 분야 진입 장벽 완화 및 비용 경감

   - 개인 화주에 대한 소규모 물류 처리 비용 경감

   - 운송 주선인의 신규 고객 영업 비용 경감

   - 화주와 운송 주선인 사이 정보 비대칭성 완화

     

### 2. Abstract (영문)



#### Overview

- A software platform that provides LCL (less than container load) logistics estimate comparison service to reduce information asymmetry between consumer and the provider

  

#### Problem

- **Consumers** want to use the logistics service about small-scale cargo at low price

- **Forwarding service provider** want to operate containers at low cost by utilizing all of the space

- Because of the logistics disruption caused by the COVID-19 pandemic, the demand for the LCL logistics is increasing.

- Currently, information asymmetry exists when consumers access LCL logistics estimates.

- Therefore, customers using LCL logistics services have inefficiencies in terms of time and cost.

- Suppliers also have inefficiencies in terms of physically moving for field sales.

- To improve the problem caused by information asymmetry, We want to provide a service that allows you to manage logistics estimates through one platform.

- Therefore, a platform to compare logistics estimates between consumer and the provider was proposed.

  

#### Solution

1. **Small-scale cargo owner perspective (consumer)**

   - You can enter information to request a delivery quote for small shipments

   - It is possible to request interlocking of land, sea, and air logistics services

   - You can easily specify the detailed conditions for delivery of cargo based on Incoterms

   - Information asymmetry can be resolved by comparing and selecting quotes proposed by shipping brokers on one platform

   - In the case of a preferred quotation, consultation in the form of a direct message with the shipping agent is possible.

   - Can conduct assessments of service providers

     

2. **Forwarding service provider perspective (provider)**

   - Lower sales and administrative costs by managing consumer acquisition through one platform

   - You can check the list of detailed request quotes you want to receive

   - Able to propose detailed opinions to respond to the quotation information requested by the consumer

   - Able to respond to a consultation request in the form of a direct message requested by the consumer

   - You can actually proceed with the request for a quote accepted by the user

   - Can prove the supplier's credit based on the ratings left by the consumer

     

#### Technical Implementation

- **Service distribution schema**

  ![Picture1](https://user-images.githubusercontent.com/25794814/160412622-17cab6b6-0c74-46e5-9767-9bad7839a15d.png)

  

#### Benefit

1. **expected effect**
   - From a consumer's point of view, it is possible to reduce logistics costs and reduce logistics work time by providing integrated management of supplier quotations on one platform.
   - From a supplier perspective, it is possible to flexibly acquire small cargo consumers, thereby improving inefficiencies in operating and operating costs.
   - Users can ease access to the maritime logistics industry through a platform that can consume logistics knowledge content in an integrated way.
   - It is possible to secure competitiveness in Korea's international maritime logistics industry by expanding import and export logistics and improving inefficiencies.
   - From a consumer's point of view, you can check the reliability of the supplier and choose
2. **Applications**
   - Reducing barriers to entry and lowering costs for small and medium-sized enterprises (SMEs) in the small-scale logistics processing sector
   - Reduction of small logistical handling costs for individual shippers
   - Reduced shipping costs for new customers
   - Mitigation of information asymmetry between shippers and forwarders



### 3. 소개 영상 (Youtube, 스크린샷 모음, 시연 영상, 추가링크 포함)

* **모바일 서비스 예시 동작 영상**

  ![Simulator Screen Recording - iPhone 12 Pro - 2022-03-13 at 17 15 16](https://user-images.githubusercontent.com/25794814/160404104-7dd52a30-5876-4461-80f1-787bfd52f358.gif)



### 4. 팀 소개

* **팀 배타버스 (BAETAVERSE)**

| Profile Image                                                | Name   | Student # | Role                              | Contacts                                                     |
| ------------------------------------------------------------ | ------ | --------- | --------------------------------- | ------------------------------------------------------------ |
| ![image](https://user-images.githubusercontent.com/25794814/160363730-44990537-7c06-46ef-8430-2143c4f077f8.png) | 한정택 | XXXX1718  | 팀장 / Mobile Front-End Developer | E-mail : [smart8612@gmail.com](mailto:smart8612@gmail.com)   |
| ![image](https://user-images.githubusercontent.com/25794814/160363730-44990537-7c06-46ef-8430-2143c4f077f8.png) | 서보성 | XXXX1629  | 개발자 / NLP Developer            | E-mail : [sboseong124@gmail.com](mailto:sboseong124@gmail.com) |
| ![image](https://user-images.githubusercontent.com/25794814/160363730-44990537-7c06-46ef-8430-2143c4f077f8.png) | 김현우 | XXXX1603  | 개발자 / Back-End Developer       | E-mail : [khw56184@kookmin.ac.kr](mailto:khw56184@kookmin.ac.kr) |
| ![image](https://user-images.githubusercontent.com/25794814/160363730-44990537-7c06-46ef-8430-2143c4f077f8.png) | 신준호 | XXXX1616  | 개발자 / Back-End Developer       | Email : [joonno94@kookmin.ac.kr](mailto:joonno94@kookmin.ac.kr) |
| ![image](https://user-images.githubusercontent.com/25794814/160363730-44990537-7c06-46ef-8430-2143c4f077f8.png) | 안규빈 | XXXXXXXX  | 기획자 / Service Planner          | Email : [kbahn99@cau.ac.kr](mailto:kbahn99@cau.ac.kr)        |



### 5. 사용법

- [Server 구동 가이드](#)

* [Mobile 구동 가이드](#)
* [NLP 구동 가이드](#)
