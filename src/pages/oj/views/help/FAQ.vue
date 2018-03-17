<template>
  <panel>
    <div slot="title">常见问题</div>
    <div class="content markdown-body">
      <ul>
        <li>输入和输出在哪里？
          <p>你的程序应该从<code>stdin</code>（标准输入流）中读取数据，并输出到<code>stdout</code>（标准输出流）里。
            例如你可以在C语言里使用<code>scanf</code>或者在C++里使用<code>cin</code>从标准输入流中读取数据，并在C语言里使用<code>printf</code>或者在C++里使用<code>cout</code>输出到标准输出流。
            用户程序不允许读写文件，否则可能会<code>运行时错误</code>.
          </p>
        </li>
        <li>提交记录中的执行时间有何意义？
        <p>OJ可能会用多组不同的测试数据测试你的程序。
          如果你的代码在时间限制内输出了每一组测试数据的正确答案，执行时间为所有测试点执行时间最长的一个。
          否则，执行时间没有意义。
        </p>
        </li>
        <li>如何使用C++中的<code>Int64</code>
          <p>你应该声明为<code>long long</code>类型，并且使用<code>cin/cout</code> or <code>%lld</code>输入输出，使用<code> __int64</code>会造成<code>编译错误</code>。</p>
        </li>
        <li>对Java的要求是什么？
          <p>所有程序必须以在<code>Main</code>类中的一个静态方法开始。不要使用公开的类，为避免编译错误，即使是<code>Main</code>也必须是非公开的。使用带缓冲的输入输出以避免多余的刷新流操作造成超时。</p>
        </li>
        <li>有没有格式错误？
          <p>没有格式错误，OJ会忽略数据中多余的行尾空格和制表符。
            如果还有不同，那么结果就是<code>答案错误</code>。</p>
        </li>
        <li>如何报告OJ中的Bug？
          <p>OJ是开源的，可以在<a href="https://github.com/QingdaoU/OnlineJudge">Github</a>上提交Issues。
            需要提供Bug的详情（例如环境、版本）。
            当然，我们很乐意Merge你的PR。
          </p>
        </li>
      </ul>
    </div>
  </panel>
</template>

<script>
</script>

<style lang="less" scoped>
  .content {
    font-size: 16px;
    margin: 0 50px 40px 50px;
    > ul {
      list-style: disc;
      li {
        font-size: 16px;
        margin-top: 20px;
        &:first-child {
          margin-top: 0;
        }
        p {
          font-size: 14px;
          margin-top: 5px;
        }
      }
    }
  }
</style>
