# helm chart 배포하기 (1)
## argocd namespace 생성
kubectl create namespace argocd

## argocd helm repo 추가
helm repo add argocd https://argoproj.github.io/argo-helm

## argocd helm values 파일 저장
helm show values argocd/argo-cd > argocd-values.yaml

## argocd deploy
helm install argocd argocd/argo-cd -n argocd -f argocd-values.yaml

# yaml 파일 배포하기 (2)
## argocd yaml 파일 다운로드 (argocd-server svc nodePort 설정)
curl https://raw.githubusercontent.com/Minki-An/YK-EFK/main/argocd/argocd.yaml -o /root/argocd.yaml
curl https://raw.githubusercontent.com/Minki-An/YK-EFK/main/argocd/argocd.sh -o /root/argocd.sh

## argocd deploy
kubectl apply -n argocd -f https://raw.githubusercontent.com/Minki-An/YK-EFK/main/argocd/argocd.yaml

## username/password
ARGO_PWD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
echo $ARGO_PWD
username: admin 
password: $ARGO_PWD
