from django.conf import settings
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin

from project.views import APIRootView

admin.site.site_header = 'Winter Circle'

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
]

api_patterns = [
    url(r'^$', APIRootView.as_view(), name=APIRootView.URL_NAME),
]

urlpatterns += api_patterns

urlpatterns += [
    url(r'^api-auth/', include('rest_framework.urls',
                               namespace='rest_framework')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
