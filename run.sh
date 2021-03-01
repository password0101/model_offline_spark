num_executors=200                                    ### 使用的executors数目
executor_memory=8g                                   ### 每个executors可以使用的内存
executor_cores=2                                     ### 每个executors可以使用的CPU个数
driver_memory=32g


parameterPredict="TreeClassifier gbdtPredict localVideoRecommendPredict \
inputTable:da_content_tmp.tmp_local_video_recommend_video_target_imei_predict_05_a \
outputTable:da_content_tmp.tmp_local_video_recommend_output_table_05 \
feature:30_act_days,30_days_refresh_times,30_days_starts_times,30_days_use_durations,30_days_search_num,7_act_days,7_days_refresh_times,\
male_percent,female_percent \
reserveFields:imei,video_id \
outputLabelName:predict \
outputScoreName:score \
modelName:gbdtModel200110"


sh /home/11102517/model_offline/model_offline.sh \
${num_executors} \
${executor_memory} \
${executor_cores} \
${driver_memory} \
"${parameterPredict}"



echo "$(date +"%F %T")| BDSP结束......"