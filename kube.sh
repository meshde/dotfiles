kube_set_ns() {
  export KUBE_NAMESPACE=$1
}

kube_pods() {
  kubectl get pods -l=app=$1 -n $KUBE_NAMESPACE | cut -d ' ' -f 1 | grep -v NAME
}

kube_logs() {
  parallel --line-buffer --rpl '{color} $_="\033[30;3".(++$::color%8)."m"' --tagstring {color}{}"\033[30;39m" kubectl logs -n $KUBE_NAMESPACE {} ::: $(kube_pods $1)
}

kube_exec() {
  kubectl exec -it -n $KUBE_NAMESPACE $(kube_pods $1 | head -1) -- /bin/bash
}

kube() {
  case "$1" in
    "ns" ) kube_set_ns $2 ;;
    "logs" ) kube_logs $2 ;;
    "exec" ) kube_exec $2 ;;
  esac 
}
