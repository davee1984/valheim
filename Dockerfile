FROM lloesche/valheim-server:latest

# Set the working directory
WORKDIR /valheim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean

# Download and install the latest BepInExPack Valheim from Thunderstore
RUN wget --content-disposition https://thunderstore.io/package/download/denikson/BepInExPack_Valheim/5.4.2202/ && \
    unzip denikson-BepInExPack_Valheim-5.4.2202.zip -d /valheim && \
    rm denikson-BepInExPack_Valheim-5.4.2202.zip

# Expose the necessary ports
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

# Start the Valheim server
CMD ["bash", "/valheim/start_server.sh"]
