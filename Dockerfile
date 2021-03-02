
#=============
# Set WORKDIR
#=============
WORKDIR /root

#====================================
# Install latest nodejs, npm, appium
# Using this workaround to install Appium -> https://github.com/appium/appium/issues/10020 -> Please remove this workaround asap
#====================================
ARG APPIUM_VERSION=1.18.1
ENV APPIUM_VERSION=$APPIUM_VERSION

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get -qqy install nodejs && \
    npm install -g appium@${APPIUM_VERSION} --unsafe-perm=true --allow-root && \
    npm install -g pm2@4.4.1 && \
    exit 0 && \
    npm cache clean && \
    apt-get remove --purge -y npm && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get clean

#================================
# APPIUM Test Distribution (ATD)
#================================
ARG ATD_VERSION=1.2
ENV ATD_VERSION=$ATD_VERSION
# RUN wget -nv -O RemoteAppiumManager.jar "https://github.com/AppiumTestDistribution/ATD-Remote/releases/download/${ATD_VERSION}/RemoteAppiumManager-${ATD_VERSION}.jar"
COPY core/lib/RemoteAppiumManager-1.2.jar /root/

#==================================
# Fix Issue with timezone mismatch
#==================================
ENV TZ="US/Pacific"
RUN echo "${TZ}" > /etc/timezone

#===============
# Expose Ports
#---------------
# 4723
#   Appium port
# 4567
#   ATD port
#===============
EXPOSE 4723
EXPOSE 4567

#====================================================
# Scripts to run appium and connect to Selenium Grid
#====================================================
COPY Scripts/entry_point.sh \
    Scripts/generate_config.sh \
    Scripts/wireless_connect.sh \
    Scripts/wireless_autoconnect.sh \
    Scripts/run_tasks.sh \
    /root/

COPY . /app

RUN chmod +x /root/entry_point.sh && \
    chmod +x /root/generate_config.sh && \
    chmod +x /root/wireless_connect.sh && \
    chmod +x /root/wireless_autoconnect.sh && \
    chmod +x /root/run_tasks.sh

#========================================
# Run xvfb and appium server
#========================================
CMD /root/wireless_autoconnect.sh && /root/entry_point.sh
