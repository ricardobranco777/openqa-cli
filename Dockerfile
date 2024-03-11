FROM opensuse/leap

RUN source /etc/os-release && \
	zypper addrepo https://download.opensuse.org/repositories/devel:/openQA:/Leap:/$VERSION_ID/openSUSE_Leap_$VERSION_ID devel-openQA-Leap && \
	zypper --gpg-auto-import-keys -n install openQA-client && \
	zypper addrepo https://download.opensuse.org/repositories/SUSE:/CA/$VERSION_ID/SUSE:CA.repo && \
	zypper --gpg-auto-import-keys -n install ca-certificates-suse && \
	rm -rf /var/cache
RUN git clone --depth=1 https://github.com/os-autoinst/scripts.git
RUN mkdir /etc/openqa
