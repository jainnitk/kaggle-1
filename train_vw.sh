cat /Users/kfedorenko/.kaggle/competitions/avito-demand-prediction/train_vw|gshuf > tmp
mv tmp /Users/kfedorenko/.kaggle/competitions/avito-demand-prediction/train_vw
cat /Users/kfedorenko/.kaggle/competitions/avito-demand-prediction/train_vw|head -1202739 > train_data_vw
cat /Users/kfedorenko/.kaggle/competitions/avito-demand-prediction/train_vw|tail -300685 > validation_vw
vw-hypersearch -L -t validation_vw 1e-08 1e-02 vw -d train_data_vw -l 0.5 --l2 % -b 28 -C 1
vw -d train_data_vw -l 0.0526453 --l2 5.36402e-06 -b 28  -f logistic.model
vw -i logistic.model -t /Users/kfedorenko/.kaggle/competitions/avito-demand-prediction/train_vw -p train_predictions --quiet 
vw -i logistic.model -t /Users/kfedorenko/.kaggle/competitions/avito-demand-prediction/test_vw -p test_predictions --quiet 
#vw -d data/vw_sessions_train_fs.gz --invert_hash logistic.model.readable -t -i  logistic.model --compressed 
