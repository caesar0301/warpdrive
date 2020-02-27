## 数据库操作语法
mongo --path
db.AddUser(username,password)  添加用户
db.auth(usrename,password)     设置数据库连接验证
db.cloneDataBase(fromhost)     从目标服务器克隆一个数据库
db.commandHelp(name)           returns the help for the command
db.copyDatabase(fromdb,todb,fromhost)  复制数据库fromdb---源数据库名称，todb---目标数据库名称，fromhost---源数据库服务器地址
db.createCollection(name,{size:3333,capped:333,max:88888})  创建一个数据集，相当于一个表
db.currentOp()                 取消当前库的当前操作
db.dropDataBase()              删除当前数据库
db.eval(func,args)             run code server-side
db.getCollection(cname)        取得一个数据集合，同用法：db['cname'] or db.cname
db.getCollenctionNames()       取得所有数据集合的名称列表
db.getLastError()              返回最后一个错误的提示消息
db.getLastErrorObj()           返回最后一个错误的对象
db.getMongo()                  取得当前服务器的连接对象get the server connection object
db.getMondo().setSlaveOk()     allow this connection to read from then nonmaster membr of a replica pair
db.getName()                   返回当操作数据库的名称
db.getPrevError()              返回上一个错误对象
db.getProfilingLevel()         ?什么等级
db.getReplicationInfo()        ?什么信息
db.getSisterDB(name)           get the db at the same server as this onew
db.killOp()                    停止（杀死）在当前库的当前操作
db.printCollectionStats()      返回当前库的数据集状态
db.printReplicationInfo()
db.printSlaveReplicationInfo()
db.printShardingStatus()       返回当前数据库是否为共享数据库
db.removeUser(username)        删除用户
db.repairDatabase()            修复当前数据库
db.resetError()                
db.runCommand(cmdObj)          run a database command. if cmdObj is a string, turns it into {cmdObj:1}
db.setProfilingLevel(level)    0=off,1=slow,2=all
db.shutdownServer()            关闭当前服务程序
db.version()                   返回当前程序的版本信息
## 数据集(表)操作语法
db.linlin.find({id:10})          返回linlin数据集ID=10的数据集
db.linlin.find({id:10}).count()  返回linlin数据集ID=10的数据总数
db.linlin.find({id:10}).limit(2) 返回linlin数据集ID=10的数据集从第二条开始的数据集
db.linlin.find({id:10}).skip(8)  返回linlin数据集ID=10的数据集从0到第八条的数据集
db.linlin.find({id:10}).limit(2).skip(8)  返回linlin数据集ID=1=的数据集从第二条到第八条的数据
db.linlin.find({id:10}).sort()   返回linlin数据集ID=10的排序数据集
db.linlin.findOne([query])       返回符合条件的一条数据
db.linlin.getDB()                返回此数据集所属的数据库名称
db.linlin.getIndexes()           返回些数据集的索引信息
db.linlin.group({key:...,initial:...,reduce:...[,cond:...]})
db.linlin.mapReduce(mayFunction,reduceFunction,<optional params>)
db.linlin.remove(query)                      在数据集中删除一条数据
db.linlin.renameCollection(newName)          重命名些数据集名称
db.linlin.save(obj)                          往数据集中插入一条数据
db.linlin.stats()                            返回此数据集的状态
db.linlin.storageSize()                      返回此数据集的存储大小
db.linlin.totalIndexSize()                   返回此数据集的索引文件大小
db.linlin.totalSize()                        返回些数据集的总大小
db.linlin.update(query,object[,upsert_bool]) 在此数据集中更新一条数据                         
db.linlin.validate()                         验证此数据集                                        
db.linlin.getShardVersion()                  返回数据集共享版本号
db.linlin.find({'name':'foobar'})    select * from linlin where name='foobar'
db.linlin.find()                     select * from linlin
db.linlin.find({'ID':10}).count()    select count(*) from linlin where ID=10
db.linlin.find().skip(10).limit(20)  从查询结果的第十条开始读20条数据  select * from linlin limit 10,20  ----------mysql
db.linlin.find({'ID':{$in:[25,35,45]}})  select * from linlin where ID in (25,35,45)
db.linlin.find().sort({'ID':-1})      select * from linlin order by ID desc
db.linlin.distinct('name',{'ID':{$lt:20}})   select distinct(name) from linlin where ID<20
db.linlin.group({key:{'name':true},cond:{'name':'foo'},reduce:function(obj,prev){prev.msum+=obj.marks;},initial:{msum:0}})
select name,sum(marks) from linlin group by name
db.linlin.find('this.ID<20',{name:1})     select name from linlin where ID<20
db.linlin.insert({'name':'foobar','age':25})  insert into linlin ('name','age') values('foobar',25)
db.linlin.insert({'name':'foobar','age':25,'email':'cclove2@163.com'})
db.linlin.remove({})                   delete * from linlin
db.linlin.remove({'age':20})           delete linlin where age=20
db.linlin.remove({'age':{$lt:20}})     delete linlin where age<20
db.linlin.remove({'age':{$lte:20}})    delete linlin where age<=20
db.linlin.remove({'age':{$gt:20}})     delete linlin where age>20
db.linlin.remove({'age':{$gte:20}})    delete linlin where age>=20
db.linlin.remove({'age':{$ne:20}})     delete linlin where age!=20
db.linlin.update({'name':'foobar'},{$set:{'age':36}})  update linlin set age=36 where name='foobar'
db.linlin.update({'name':'foobar'},{$inc:{'age':3}})   update linlin set age=age+3 where name='foobar'