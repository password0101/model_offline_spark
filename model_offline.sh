num_executors=$1            ### 使用的executors数目
executor_memory=$2          ### 每个executors可以使用的内存
executor_cores=$3           ### 每个executors可以使用的CPU个数
driver_memory=$4            ### driver端可以使用的内存
parameter=$5                ### 算法参数


############## 执行model_offline
echo -e "$(date +"%F %T") | 执行model_offline | start ----> \n\n"

spark2-submit \
--class com.vivo.ic.dm.service.ModelOfflineService \
--master yarn \
--deploy-mode client \
--queue root.exstat.cmodel \
--conf spark.kryoserializer.buffer.max=256m \
--conf spark.kryoserializer.buffer=128m \
--conf spark.driver.maxResultSize=3g \
--conf spark.port.maxRetries=100 \
--num-executors ${num_executors} \
--executor-memory ${executor_memory} \
--executor-cores ${executor_cores} \
--driver-memory ${driver_memory} \
/home/11102517/model_offline/model_offline-1.0-SNAPSHOT-jar-with-dependencies.jar \
"${parameter}"
