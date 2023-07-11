FROM opensuse/leap

RUN source /etc/os-release && \
	zypper addrepo -G -cfp 91 https://download.opensuse.org/repositories/devel:/openQA:/Leap:/$VERSION/openSUSE_Leap_$VERSION devel-openQA-Leap
RUN zypper in -y openQA-client
RUN git clone https://github.com/os-autoinst/scripts.git
RUN mkdir /etc/openqa
COPY client.conf /etc/openqa/client.conf
