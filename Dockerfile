FROM opensuse/leap

RUN source /etc/os-release && \
	zypper addrepo -G -cfp 91 https://download.opensuse.org/repositories/devel:/openQA:/Leap:/$VERSION/openSUSE_Leap_$VERSION devel-openQA-Leap && \
	zypper in -y openQA-client && \
	curl -sOk https://dist.nue.suse.com/ibs/SUSE:/CA/$VERSION/SUSE:CA.repo && \
	zypper addrepo SUSE:CA.repo && \
	rm -f SUSE:CA.repo && \
	zypper in -y ca-certificates-suse && \
	zypper clean
RUN git clone --depth=1 https://github.com/os-autoinst/scripts.git
RUN mkdir /etc/openqa
COPY client.conf /etc/openqa/client.conf
