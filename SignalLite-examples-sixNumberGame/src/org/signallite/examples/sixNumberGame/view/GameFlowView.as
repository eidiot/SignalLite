package org.signallite.examples.sixNumberGame.view
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import org.signallite.examples.sixNumberGame.message.GameFlowEvent;
    import org.signallite.examples.sixNumberGame.view.controls.GameFlowButton;


    public class GameFlowView extends Sprite
    {
        //======================================================================
        //  Variables
        //======================================================================
        private var startButton:Sprite;
        //======================================================================
        //  Public methods
        //======================================================================
        public function showStart():void
        {
            if (!startButton)
            {
                startButton = new GameFlowButton("Play Game");
                startButton.addEventListener(MouseEvent.CLICK, startButton_clickHandler);
            }
            render(startButton);
        }
        public function showPlaying():void
        {
            clean();
        }
        //======================================================================
        //  Private methods
        //======================================================================
        private function clean():void
        {
            while (numChildren > 0)
            {
                removeChildAt(0);
            }
        }
        private function render(content:Sprite):void
        {
            clean();
            content.x = 10;
            addChild(content);
        }
        //======================================================================
        //  Event handlers
        //======================================================================
        private function startButton_clickHandler(event:MouseEvent):void
        {
            dispatchEvent(new GameFlowEvent(GameFlowEvent.START_GAME));
        }
    }
}