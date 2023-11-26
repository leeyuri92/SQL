-- < Book 테이블 >

select *
from Book;

-- [질의 3-1] 모든 도서의 이름과 가격을 검색하시오.

select bookname, price
from book;

-- [질의 3-2] 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.

select *
from Book;

-- [질의 3-3] 도서 테이블에 있는 모든 출판사를 검색하시오.

select  publisher
from book;

select distinct publisher
from book;

-- [질의 3-4] 가격이 20,000원 미만인 도서를 검색하시오.

select *
from book
where price <20000;

-- [질의 3-5] 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.

select *
from book
where price between 10000 and 20000;


-- [질의 3-6] 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’ 인 도서를 검색하시오.

select *
from book
where publisher = '굿스포츠' or publisher ='대한미디어';

select *
from book
where publisher in ('굿스포츠','대한미디어');

-- [질의 3-7] ‘축구의 역사’를 출간한 출판사를 검색하시오.

select publisher
from book
where bookname = '축구의 역사';

select publisher, bookname
from book
where bookname like '축구의 역사';


-- [질의 3-8] 도서이름에 ‘축구’ 가 포함된 출판사를 검색하시오.

select publisher, bookname
from book
where bookname like '%축구%';

-- [질의 3-9] 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 검색하시오.

select bookname
from book
where bookname like '_구%';

select bookname
from book
where substr(bookname,2,1) = '구';

-- [질의 3-10] 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오

select *
from book
where bookname like '%축구%' 
and price >= 20000;

-- [질의 3-11] 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’ 인 도서를 검색하시오.

select *
from book
where publisher in('굿스포츠','대한미디어');

-- [질의 3-12] 도서를 이름순으로 검색하시오.

select *
from book
order by bookname;

-- [질의 3-13] 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.

select *
from book
order by price, bookname;

-- [질의 3-14] 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 출력하시오.

select *
from book
order by price desc, publisher;

-- < Orders 테이블 >
select *
from orders;

-- [질의 3-15] 고객이 주문한 도서의 총 판매액을 구하시오.

select sum(saleprice)
from orders;

-- [질의 3-16] 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.

select sum(saleprice)
from orders
where custid = 2;

-- [질의 3-17] 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.

select sum(saleprice) 총판매액 ,
       avg(saleprice) 평균값,
       min(saleprice) 최저가, 
       max(saleprice) 최고가
from orders;

-- [질의 3-18] 마당서점의 도서 판매 건수를 구하시오.

select count(*)
from orders;

-- [질의 3-19] 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.

select custid, count(*) 도서수량, sum(saleprice) 판매액
from orders
group by custid;


-- [질의 3-20] 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두 권 이상 구매한 고객만 구하시오.

select custid, 총수량
from(
select custid, count(*) 총수량
from orders
where saleprice >=8000 
group by custid)
where 총수량 >=2;

select custid, count(*) 총수량
from orders
where saleprice >=8000 
group by custid
having count(*) >=2;


-- < 여기부터는 Customer, Orders, Book 테이블 중 알아서 ㅋ  >
-- [질의 3-21] 고객과 고객의 주문에 관한 데이터를 모두 보이시오.

select *
from customer, orders
where customer.custid= orders.custid;

--[질의 3-22] 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 보이시오.

select *
from customer, orders
where customer.custid= orders.custid
order by customer.custid;


--[질의 3-23] 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.

select name, saleprice
from customer, orders
where customer.custid= orders.custid;

--[질의 3-24] 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.

select name, sum(saleprice)
from customer, orders
where customer.custid= orders.custid
group by name
order by name;

--[질의 3-25] 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.

select name, bookname
from book, customer, orders
where orders.custid = customer.custid
and orders.bookid=book.bookid;

--[질의 3-26] 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.

select name, bookname
from book, customer, orders
where orders.custid = customer.custid
and orders.bookid=book.bookid
and book.price =20000;

--[질의 3-27] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.

select name, saleprice
from customer left join orders
on customer.custid = orders.custid;

--[질의 3-28] 가장 비싼 도서의 이름을 보이시오.
select bookname
from book
where price =(
              select max(price)
              from book
              );


select max(price)
from book;

--[질의 3-29] 도서를 구매한 적이 있는 고객의 이름을 검색하시오.

select distinct name 
from orders,customer
where customer.custid = orders.custid;

select name
from customer
where custid in(select custid from orders);

--[질의 3-30] ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 보이시오.

select bookid
from book
where publisher = '대한미디어';

select custid
from orders,book
where orders.bookid = book.bookid
and publisher = '대한미디어';

select name
from customer
where custid = (
                select custid
                from orders,book
                where orders.bookid = book.bookid
                and publisher = '대한미디어');
                
select name
from customer
where custid in (
                select custid
                from orders
                where bookid in(select bookid
                                from book
                                where publisher = '대한미디어'));
                                

--[질의 3-31] 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.

select publisher,avg(price)
       from book
       group by publisher;

select bookname
from ( select avg(price)
       from book
       group by publisher)
where price > avg(price);

select a.bookname
from book a
where a.price > (select avg(b.price)
       from book b
       group by b.publisher);

select bookname
from book a ,(
select publisher,avg(price) 평균
       from book
       group by publisher)b
where a.publisher = b.publisher
and price > 평균;

select a.bookname
from book a
where a.price > (select avg(b.price)
                 from book b
                 where a.publisher = b.publisher);

--[질의 3-32] 도서를 주문하지 않은 고객의 이름을 보이시오.

select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

select name
from customer
where not exists (select custid
              from orders
              where customer.custid = orders.custid);


select name
from customer left join orders
on customer.custid = orders.custid
where orders.custid is null;


--[질의 3-33] 주문이 있는 고객의 이름과 주소를 보이시오.

select name, address
from customer
where custid in( select custid
                 from orders);
                 
select name, address
from customer
where exists (select *
              from orders
              where customer.custid = orders.custid);
              
              
              
--차집합 시 사용가능 함수(32번 문제 참고)

select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

select name
from customer
where not exists (select custid
              from orders
              where customer.custid = orders.custid);

select name
from customer left join orders
on customer.custid = orders.custid
where orders.custid is null;

