-- Create table
create table A8
(
  a1 VARCHAR2(500)
);



create or replace procedure proc_add_test as
begin
   insert into A8 values('1');
  commit;
end;


declare
  job number;
BEGIN
  DBMS_JOB.SUBMIT(  
        JOB => job,  /*�Զ�����JOB_ID*/  
        WHAT => 'proc_add_test;',  /*��Ҫִ�еĴ洢�������ƻ�SQL���*/  
        NEXT_DATE => sysdate+1/(24*60),  /*����ִ��ʱ��-��һ��1����*/  
        INTERVAL => 'trunc(sysdate,''mi'')+30/(24*60*60)' /*ÿ��30��ִ��һ��*/
      );  
  commit;
end;

--�鿴��ʱ������id����������
select * from user_jobs;

begin    
      dbms_job.run(����id); 
     -- commit;  
end;