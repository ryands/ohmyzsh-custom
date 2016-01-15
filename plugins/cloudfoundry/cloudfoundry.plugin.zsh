# API endpoint:   https://api.run.pivotal.io (API version: 2.44.0)
# User:           rschultz@grio.com
# Org:            Yahoo Rivals
# Space:          production

cloudfoundry_target() {
    CF_COLOR=false CF_TRACE=false cf target | while read line ; do  
        key=$(echo "$line" | cut -f1 -d ':' | xargs)
        val=$(echo "$line" | cut -f2- -d ':' | xargs)

        case $key in
            "User")
                user=$val
                ;;
            "Org")
                org=$val
                ;;
            "Space")
                space=$val
                ;;
            *)
                ;;
        esac
    done
    echo "$user|$org|$space"
}


