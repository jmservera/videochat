# Video Chat app deployment to Azure

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjmservera%2Fvideochat%2Fmain%2Fazuredeploy.json)

This is a [WebRTC test](https://tsh.io/blog/how-to-write-video-chat-app-using-webrtc-and-nodejs/) template to deploy a Web app + a [TURN server](https://devblogs.microsoft.com/cse/2018/01/29/orchestrating-turn-servers-cloud-deployment/) in Azure, with SSL Certificates from letsencrypt.org

You can find more WebRTC good explanations in [this article](https://webrtc.ventures/2018/07/tutorial-build-video-conference-application-webrtc-2/), and you can use [Trickle ICE](https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/) page to check your TURN server configuration.

Check also the [Video Chat Web App](https://github.com/jmservera/videochat-webapp) that is deployed in an Azure Web App through the template and the [article explaining the code shown here](https://jmblog.servezas.org/en/2020/07/how-to-create-a-video-chat-service/).

