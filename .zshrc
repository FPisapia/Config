  GNU nano 8.7.1                                                                                 /home/federico/.zshrc
      echo "Run 'connect --help' for usage."
      return 1
      ;;
  esac
}

_disconnect_aws() {
  unset AWS_PROFILE
  unset AWS_WHOAMI
  echo "AWS disconnected from this session."
}

_disconnect_k8s() {
  kubectl config unset current-context > /dev/null 2>&1
  echo "Kubernetes disconnected from this session."
}

disconnect() {
  case "$1" in
    aws)
      _disconnect_aws
      ;;
    k8s)
      _disconnect_k8s
      ;;
    -a|--all|"")
      _disconnect_aws
      _disconnect_k8s
      ;;
    -h|--help)
      cat << 'HELP'
Usage: disconnect [option]

  aws           Disconnect only AWS (unset profile)
  k8s           Disconnect only Kubernetes (unset context)
  -a, --all     Disconnect both AWS and Kubernetes (default if no option given)
  -h, --help    Show this help message
HELP
      ;;
    *)
      echo "Unknown option: $1"
      echo "Run 'disconnect --help' for usage."
      return 1
      ;;
  esac
}
