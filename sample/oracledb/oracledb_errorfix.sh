
# doctorkirk/oracle-19c 이미지 컨테이너 실행 오류시 처리

# 컨테이너 접속
docker exec -it oracle19c bash

# sqlplus 접속
sqlplus / as sysdba

# 제대로 실행이 안된 상태
Connected ..... idle instance.
ORA-01034: ORACLE not available

# 오라클 인스턴스 실행
startup
# 인스턴스 실행을 시도 하였으나, 파일이 없어서 실행이 안됨.
# could not open parameter file '/opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora'

# 관련 설정 파일
cd /opt/oracle/admin/ORCL/pfile

# init.ora 파일을 -> /opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora 복사

# 해당 파일이 위치한 경로에 있는 경우
cp init.ora.720202525355 /opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora

# 경로로 이동하지 않고, 전체 경로로 입력 (full path)
cp /opt/oracle/admin/ORCL/pfile/init.ora /opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora

# 복사된 설정파일 존재 확인
cd /opt/oracle/product/19c/dbhome_1/dbs
ls

# DB 인스턴스 종료 후 재시작
sqlplus / as sysdba
SHUTDOWN ABORT; # 강제종료

# 실행
STARTUP NOMOUNT;
ALTER DATABASE MOUNT;
ALTER DATABASE OPEN;