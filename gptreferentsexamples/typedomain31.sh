# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

SEEDS=(171 354 550 667 985)
N=3
K=1
mode=inter
distance_mode=cat
dataset=Domain

for seed in ${SEEDS[@]}; do
#   python3 main.py \
 #     --dataset=${dataset} \
  #     --gpu_device=1 \
   #    --seed=${seed} \
    #   --mode=${mode} \
#       --N=${N} \
 #      --K=${K} \
 #      --similar_k=10 \
  #     --eval_every_meta_steps=20 \
   #    --name=10-k_100_2_16_3_max_loss_2_5_BIOES \
  #     --train_mode=span \
   #    --inner_steps=2 \
    #   --inner_size=16 \
#       --max_ft_steps=50 \
 #      --max_type_ft_steps=40 \
  #     --lambda_max_loss=2 \
   #    --inner_lambda_max_loss=5 \
    #   --tagging_scheme=BIOES \
  #     --viterbi=hard \
   #    --add_trained_span \
    #   --concat_types=None
#
    python3 main.py \
        --dataset=${dataset} \
        --seed=${seed} \
        --gpu_device=1 \
        --mode=${mode} \
        --N=${N} \
        --K=${K} \
        --similar_k=40 \
        --inner_similar_k=40 \
        --eval_every_meta_steps=10 \
        --name=10-k_100_type_2_16_3_10_10 \
        --train_mode=type \
        --inner_steps=2 \
        --inner_size=16 \
        --use_classify \
        --distance_mode=${distance_mode} \
	--max_meta_steps=181 \
        --max_ft_steps=30 \
        --max_type_ft_steps=20 \
        --concat_types=None \
        --tagging_scheme=BIOES \
        --lambda_max_loss=2.0 \
        --inner_lambda_max_loss=5.0
#
 #  cp models-${N}-${K}-${mode}/bert-base-uncased-innerSteps_2-innerSize_16-lrInner_3e-05-lrMeta_3e-05-maxSteps_301-seed_${seed}-name_10-k_100_type_2_16_3_10_10/en_type_pytorch_model.bin models-${N}-${K}-${mode}/bert-base-uncased-innerSteps_2-innerSize_16-lrInner_3e-05-lrMeta_3e-05-maxSteps_301-seed_${seed}-name_10-k_100_2_16_3_max_loss_2_5_BIOES
#
 #  python3 main.py \
  #    --dataset=${dataset} \
#       --gpu_device=1 \
 #      --seed=${seed} \
  #     --N=${N} \
   #    --K=${K} \
    #   --mode=${mode} \
     #  --similar_k=10 \
   #    --name=10-k_100_2_16_3_max_loss_2_5_BIOES \
    #   --concat_types=None \
 #      --test_only \
  #     --eval_mode=two-stage \
   #    --use_classify \
#       --distance_mode=${distance_mode} \
  #     --inner_steps=2 \
 #      --inner_size=16 \
   #    --max_ft_steps=50 \
 #      --max_type_ft_steps=40 \
  #     --lambda_max_loss=2.0 \
   #    --inner_lambda_max_loss=5.0 \
    #   --inner_similar_k=10 \
     #  --viterbi=hard \
  #     --tagging_scheme=BIOES
done
