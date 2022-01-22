sudo docker run -d --restart always\
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e TZ=Asia/Jakarta \
    -e WATCHTOWER_HTTP_API=true \
    -e WATCHTOWER_NOTIFICATIONS=shoutrrr \
    -e WATCHTOWER_NOTIFICATION_URL="discord://c2Dx2Kz9-rFfqAZ74Wei9Wa2zr8F3sMy0J2K9TVD3bMsxIZY2VQe3o33o0SIShIGa0oM@816512109075628052?avatar=https://res.cloudinary.com/dedyms/image/upload/c_thumb,w_200,g_face/v1622537775/container/logo-450px_msury4.png&username=Watchtower&splitlines=no" \
    -e WATCHTOWER_NOTIFICATION_TEMPLATE="{{range .}}{{.Time.Format \"2006-01-02 15:04:05\"}} ({{.Level}}): {{.Message}}{{println}}{{end}}" \
    containrrr/watchtower \
    --debug \
    --cleanup \
    --trace \
    --interval 86400 \
    --label-enable
