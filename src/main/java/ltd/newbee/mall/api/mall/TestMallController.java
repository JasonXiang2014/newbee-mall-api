package ltd.newbee.mall.api.mall;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController  // 必须加，标记为REST接口控制器
@RequestMapping("/api/mall/test")  // 类级别的请求路径
public class TestMallController {

    // 方法级别的GET请求，必须加@GetMapping/@PostMapping等
    @GetMapping("/hello")
    public String hello() {
        return "hello newbee mall!";
    }
}