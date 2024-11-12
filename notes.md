python scripts/sec_eval.py --output_name starcoderbase-1b --model_name starcoderbase-1b --eval_type trained-new

should use trained-new for fair comparison 
trained -> He & Vechev (sven)
trained-new -> He & Vero (SafeCoder)
whats not-trained?

# original, starcoderbase-1b
model=starcoderbase-1b
python sec_eval.py --output_name $model --model_name $model --eval_type trained-new-c-only

## eval
model=starcoderbase-1b
python print_results.py --eval_name $model --eval_type trained-new-c-only --detail

# original, codellama-7b
model=codellama-7b
python sec_eval.py --output_name $model --model_name $model --eval_type trained-new-c-only



# kto, 4096 * 0.8 * 2 = 6.3k examples from bigvul in starcoderbase-1b
model=starcoderbase-1b-kto
python sec_eval.py --output_name $model --model_name $model --eval_type trained-new-c-only




# kto, 1.7w * 0.8 *2= 2.7w examples from bigvul in codellama7b
model=codellama-7b-kto
python sec_eval.py --output_name $model --model_name $model --eval_type trained-new-c-only


# cwe
c-only
119-0, 119-1, 
611-0,
676-0,
732-0,732-1
target for trained-new (SafeCoder)