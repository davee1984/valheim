FROM lloesche/valheim-server:latest

# Set the working directory
WORKDIR /valheim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean

# Download and install the latest BepInExPack Valheim from Thunderstore
RUN wget -O BepInExPack-Valheim.zip "https://thunderstore.io/c/valheim/p/bepinexpack-valheim/latest/download/" && \
    unzip BepInExPack-Valheim.zip -d /valheim && \
    rm BepInExPack-Valheim.zip

# Expose the necessary ports
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

# Start the Valheim server
CMD ["bash", "/valheim/start_server.sh"]
