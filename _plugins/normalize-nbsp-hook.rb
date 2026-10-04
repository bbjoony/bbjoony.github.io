#!/usr/bin/env ruby
#
# Pages CMS 에디터로 쓴 글에 줄바꿈 금지 공백(U+00A0)이 섞여 들어오면
# word-break: keep-all 에서 공백 위치로 줄을 바꾸지 못해 줄이 어색하게 끊깁니다.
# 렌더링 전에 일반 공백으로 바꿉니다. (&nbsp; 엔티티로 직접 쓴 공백은 그대로 둡니다.)

Jekyll::Hooks.register :documents, :pre_render do |doc|
  doc.content = doc.content.tr(" ", " ") if doc.content.include?(" ")
end
