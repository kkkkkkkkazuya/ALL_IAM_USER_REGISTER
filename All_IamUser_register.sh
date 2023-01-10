for a in `cat $1`
do
USER_NAME=`echo ${a} | awk -F, '{print $1}'`
USER_PASS=`echo ${a} | awk -F, '{print $2}'`
GROUP_NAME=`echo ${a} | awk -F, '{print $3}'`
aws iam create-user --user-name ${USER_NAME} --tags Key=タグのKEY,Value=タグの値 --no-verify && \
aws iam create-login-profile --user-name ${USER_NAME} --password ${USER_PASS} --password-reset-required --no-verify && \
aws iam attach-user-policy --user-name ${USER_NAME} --policy-arn arn:aws:iam::aws:policy/IAMUserChangePassword --no-verify && \
aws iam add-user-to-group --user-name ${USER_NAME} --group-name ${GROUP_NAME} --no-verify
done